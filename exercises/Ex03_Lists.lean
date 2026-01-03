/-
  Exercise 03: List Operations
  ============================

  This file explores proofs about lists, a fundamental data structure.
  Lists in Lean are defined inductively:
  - `[]` : the empty list
  - `x :: xs` : element x followed by list xs

  Key operations:
  - `List.length` : number of elements
  - `List.append` (or `++`) : concatenate two lists
  - `List.reverse` : reverse a list
  - `List.map` : apply function to each element

  Difficulty: Intermediate
-/

namespace Ex03_Lists

/-
  SECTION 1: Basic List Properties
  --------------------------------
  Simple facts about list construction and length.
-/

-- Exercise 1.1: The empty list has length 0
theorem length_nil : ([] : List Nat).length = 0 := by
  sorry

-- Exercise 1.2: Adding an element increases length by 1
theorem length_cons (x : Nat) (xs : List Nat) :
    (x :: xs).length = xs.length + 1 := by
  sorry

-- Exercise 1.3: A specific example
theorem length_example : [1, 2, 3].length = 3 := by
  sorry

/-
  SECTION 2: List Append
  ----------------------
  The append operation (++) joins two lists.
-/

-- Exercise 2.1: Appending empty list on the right gives the same list
theorem append_nil (xs : List Nat) : xs ++ [] = xs := by
  sorry

-- Exercise 2.2: Appending empty list on the left gives the same list
theorem nil_append (xs : List Nat) : [] ++ xs = xs := by
  sorry

-- Exercise 2.3: Length of append is sum of lengths
-- Hint: Try `simp [List.length_append]` or `omega` with appropriate lemmas
theorem length_append (xs ys : List Nat) :
    (xs ++ ys).length = xs.length + ys.length := by
  sorry

-- Exercise 2.4: Append is associative
-- Hint: Try `simp [List.append_assoc]`
theorem append_assoc (xs ys zs : List Nat) :
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  sorry

/-
  SECTION 3: List Reverse
  -----------------------
  Reversing a list swaps the order of elements.
-/

-- Exercise 3.1: Reversing empty list gives empty list
theorem reverse_nil : ([] : List Nat).reverse = [] := by
  sorry

-- Exercise 3.2: Length is preserved by reverse
-- Hint: Use `List.length_reverse`
theorem length_reverse (xs : List Nat) :
    xs.reverse.length = xs.length := by
  sorry

-- Exercise 3.3: Reversing twice gives the original list
-- Hint: Use `List.reverse_reverse`
theorem reverse_reverse (xs : List Nat) :
    xs.reverse.reverse = xs := by
  sorry

-- Exercise 3.4: Reverse distributes over append (with swap)
-- Hint: Use `List.reverse_append`
theorem reverse_append (xs ys : List Nat) :
    (xs ++ ys).reverse = ys.reverse ++ xs.reverse := by
  sorry

/-
  SECTION 4: List Map
  -------------------
  Map applies a function to each element of a list.
-/

-- A simple function for exercises
def double (n : Nat) : Nat := n * 2

-- Exercise 4.1: Mapping over empty list gives empty list
theorem map_nil (f : Nat -> Nat) : [].map f = [] := by
  sorry

-- Exercise 4.2: Length is preserved by map
-- Hint: Use `List.length_map`
theorem length_map (f : Nat -> Nat) (xs : List Nat) :
    (xs.map f).length = xs.length := by
  sorry

-- Exercise 4.3: Mapping the identity function does nothing
-- Hint: Use `List.map_id`
theorem map_id (xs : List Nat) : xs.map id = xs := by
  sorry

-- Exercise 4.4: Map distributes over append
-- Hint: Use `List.map_append`
theorem map_append (f : Nat -> Nat) (xs ys : List Nat) :
    (xs ++ ys).map f = xs.map f ++ ys.map f := by
  sorry

/-
  SECTION 5: List Membership
  --------------------------
  The `elem` function checks if an element is in a list.
-/

-- Exercise 5.1: An element is in a singleton list containing it
theorem mem_singleton (x : Nat) : x ∈ [x] := by
  sorry

-- Exercise 5.2: If x is in xs, then x is in y :: xs
-- Hint: Use `List.mem_cons_of_mem`
theorem mem_cons_of_mem (x y : Nat) (xs : List Nat) (h : x ∈ xs) :
    x ∈ y :: xs := by
  sorry

-- Exercise 5.3: The head element is in the list
-- Hint: Use `List.mem_cons_self`
theorem mem_cons_self (x : Nat) (xs : List Nat) : x ∈ x :: xs := by
  sorry

/-
  SECTION 6: Challenge Problems
  -----------------------------
  These require combining multiple techniques.
-/

-- Challenge 6.1: Reverse of a singleton is itself
theorem reverse_singleton (x : Nat) : [x].reverse = [x] := by
  sorry

-- Challenge 6.2: Map composition
-- Hint: Use `List.map_map`
theorem map_map (f g : Nat -> Nat) (xs : List Nat) :
    (xs.map f).map g = xs.map (g ∘ f) := by
  sorry

-- Challenge 6.3: If xs ++ ys = [] then both xs and ys are []
-- Hint: Try `simp [List.append_eq_nil]`
theorem append_eq_nil (xs ys : List Nat) :
    xs ++ ys = [] ↔ xs = [] ∧ ys = [] := by
  sorry

-- Challenge 6.4: Proving a specific computation
theorem specific_computation :
    ([1, 2, 3].map double).reverse = [6, 4, 2] := by
  sorry

end Ex03_Lists
