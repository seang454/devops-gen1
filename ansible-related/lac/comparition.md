### Compare All Set Operations
```bash
List A = ['asia-east1-a', 'asia-southeast2-a']           ← UP zones
List B = ['asia-east1-a', 'asia-southeast2-a', 'asia-east2-a']  ← configured zones

┌──────────────────────┬─────────────────────────────────────────┐
│ Operation            │ Result                                  │
├──────────────────────┼─────────────────────────────────────────┤
│ union                │ all unique items from both lists        │
│                      │ ['asia-east1-a', 'asia-southeast2-a',   │
│                      │  'asia-east2-a']                        │
├──────────────────────┼─────────────────────────────────────────┤
│ intersect            │ items that exist in BOTH lists          │
│                      │ ['asia-east1-a', 'asia-southeast2-a']   │
├──────────────────────┼─────────────────────────────────────────┤
│ difference           │ items in A but NOT in B                 │
│                      │ []  (A has nothing B doesn't)           │
├──────────────────────┼─────────────────────────────────────────┤
│ symmetric_difference │ items in ONE list but NOT BOTH          │
│                      │ ['asia-east2-a']  ← only in B (DOWN)    │
└──────────────────────┴─────────────────────────────────────────┘

```
### Why We Use It Here
```bash
We want to find: "which zones did I configure that are NOT up?"

A = UP zones from GCP    = ['asia-east1-a', 'asia-southeast2-a']
B = zones in my vars     = ['asia-east1-a', 'asia-southeast2-a', 'asia-east2-a']

symmetric_difference     = ['asia-east2-a']
                               ↑
                         exists in B (my config)
                         but NOT in A (GCP UP zones)
                         = this zone is DOWN ❌
                         
```