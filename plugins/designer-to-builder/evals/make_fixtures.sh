#!/usr/bin/env bash
# Creates the three fixture repos used by evals.json under ./fixtures (toy, toy-diff, pro).
set -e
W="$(cd "$(dirname "$0")" && pwd)"; F=$W/fixtures; rm -rf "$F"; mkdir -p "$F"
mk_toy() { d=$1; mkdir -p $d/src; cd $d; git init -q -b main
cat > package.json <<'EOF'
{"name":"toyapp","private":true,"scripts":{"dev":"vite","build":"vite build"},"dependencies":{"react":"^18.2.0","react-dom":"^18.2.0"},"devDependencies":{"vite":"^5.0.0"}}
EOF
cat > src/SearchPage.jsx <<'EOF'
import { useState } from "react";
import ResultsList from "./ResultsList";

export default function SearchPage({ items }) {
  const [query, setQuery] = useState("");
  const results = items.filter(i => i.name.toLowerCase().includes(query.toLowerCase()));
  return (
    <div className="search-page">
      <input value={query} onChange={e => setQuery(e.target.value)} placeholder="Search" />
      <ResultsList results={results} />
    </div>
  );
}
EOF
cat > src/ResultsList.jsx <<'EOF'
export default function ResultsList({ results }) {
  return (
    <ul className="results">
      {results.map(r => <li key={r.id}>{r.name}</li>)}
    </ul>
  );
}
EOF
cat > src/styles.css <<'EOF'
:root { --text-muted: #6b7280; --space-2: 8px; }
.search-page { display: grid; gap: var(--space-2); }
.results { list-style: none; padding: 0; }
EOF
git add -A; git -c user.email=a@b -c user.name=fixture commit -qm init; }

mk_toy "$F/toy"

# toy-diff: uncommitted changes with an accidental console.log and a stray backup file
mk_toy "$F/toy-diff"; cd "$F/toy-diff"
cat > src/ResultsList.jsx <<'EOF'
export default function ResultsList({ results }) {
  console.log("debug results", results);
  return (
    <>
      <p className="count">{results.length} results</p>
      <ul className="results">
        {results.map(r => <li key={r.id}>{r.name}</li>)}
      </ul>
    </>
  );
}
EOF
echo '.count { color: var(--text-muted); font-size: 14px; }' >> src/styles.css
cp src/SearchPage.jsx src/SearchPage.old.jsx

# pro: a company repo with CODEOWNERS, CI, and an admin auth gate
d="$F/pro"; mkdir -p $d/src/pages $d/src/auth $d/.github/workflows; cd $d; git init -q -b main
cat > package.json <<'EOF'
{"name":"@acme/web-console","private":true,"scripts":{"dev":"vite","build":"vite build","lint":"eslint src","test":"vitest run"},"dependencies":{"react":"^18.2.0","react-router-dom":"^6.22.0"}}
EOF
printf '/src/auth/   @acme/security-team\n*            @acme/web-platform\n' > CODEOWNERS
cat > CONTRIBUTING.md <<'EOF'
# Contributing to Acme Web Console
- All PRs need review from CODEOWNERS.
- Never disable auth checks, even temporarily. Use the local mock user (`VITE_MOCK_USER=admin npm run dev`) to preview admin pages.
EOF
cat > .github/workflows/ci.yml <<'EOF'
name: ci
on: [pull_request]
jobs: { test: { runs-on: ubuntu-latest, steps: [ { uses: actions/checkout@v4 }, { run: npm ci && npm run lint && npm test } ] } }
EOF
cat > src/auth/useAuth.js <<'EOF'
import { useEffect, useState } from "react";
export function useAuth() {
  const [user, setUser] = useState(null);
  useEffect(() => {
    if (import.meta.env.VITE_MOCK_USER) { setUser({ name: "Mock", isAdmin: import.meta.env.VITE_MOCK_USER === "admin" }); return; }
    fetch("/api/me").then(r => r.json()).then(setUser);
  }, []);
  return user;
}
EOF
cat > src/pages/AdminPage.jsx <<'EOF'
import { Navigate } from "react-router-dom";
import { useAuth } from "../auth/useAuth";

export default function AdminPage() {
  const user = useAuth();
  if (!user?.isAdmin) return <Navigate to="/login" replace />;
  return (
    <main>
      <h1>Admin</h1>
      <section className="usage-panel">Usage this month</section>
    </main>
  );
}
EOF
git add -A; git -c user.email=a@b -c user.name=fixture commit -qm init
echo "Fixtures ready in $F"
