/-
  Solutions for Exercise 03: List Operations
  ==========================================

  These are the complete solutions for Ex03_Lists.lean.
  Study these after attempting the exercises yourself!
-/

namespace Sol03_Lists

/-
  SECTION 1: Basic List Properties
-/

-- Solution 1.1
theorem length_nil : ([] : List Nat).length = 0 := by
  rfl

-- Solution 1.2
theorem length_cons (x : Nat) (xs : List Nat) :
    (x :: xs).length = xs.length + 1 := by
  rfl

-- Solution 1.3
theorem length_example : [1, 2, 3].length = 3 := by
  rfl

/-
  SECTION 2: List Append
-/

-- Solution 2.1
theorem append_nil (xs : List Nat) : xs ++ [] = xs := by
  simp

-- Solution 2.2
theorem nil_append (xs : List Nat) : [] ++ xs = xs := by
  rfl

-- Solution 2.3
theorem length_append (xs ys : List Nat) :
    (xs ++ ys).length = xs.length + ys.length := by
  simp [List.length_append]

-- Solution 2.4
theorem append_assoc (xs ys zs : List Nat) :
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  simp [List.append_assoc]

/-
  SECTION 3: List Reverse
-/

-- Solution 3.1
theorem reverse_nil : ([] : List Nat).reverse = [] := by
  rfl

-- Solution 3.2
theorem length_reverse (xs : List Nat) :
    xs.reverse.length = xs.length := by
  simp [List.length_reverse]

-- Solution 3.3
theorem reverse_reverse (xs : List Nat) :
    xs.reverse.reverse = xs := by
  simp [List.reverse_reverse]

-- Solution 3.4
theorem reverse_append (xs ys : List Nat) :
    (xs ++ ys).reverse = ys.reverse ++ xs.reverse := by
  simp [List.reverse_append]

/-
  SECTION 4: List Map
-/

def double (n : Nat) : Nat := n * 2

-- Solution 4.1
theorem map_nil (f : Nat -> Nat) : [].map f = [] := by
  rfl

-- Solution 4.2
theorem length_map (f : Nat -> Nat) (xs : List Nat) :
    (xs.map f).length = xs.length := by
  simp [List.length_map]

-- Solution 4.3
theorem map_id (xs : List Nat) : xs.map id = xs := by
  simp [List.map_id]

-- Solution 4.4
theorem map_append (f : Nat -> Nat) (xs ys : List Nat) :
    (xs ++ ys).map f = xs.map f ++ ys.map f := by
  simp [List.map_append]

/-
  SECTION 5: List Membership
-/

-- Solution 5.1
theorem mem_singleton (x : Nat) : x ∈ [x] := by
  simp

-- Solution 5.2
theorem mem_cons_of_mem (x y : Nat) (xs : List Nat) (h : x ∈ xs) :
    x ∈ y :: xs := by
  exact List.mem_cons_of_mem y h

-- Solution 5.3
theorem mem_cons_self (x : Nat) (xs : List Nat) : x ∈ x :: xs := by
  simp

/-
  SECTION 6: Challenge Problems
-/

-- Challenge 6.1
theorem reverse_singleton (x : Nat) : [x].reverse = [x] := by
  rfl

-- Challenge 6.2
theorem map_map (f g : Nat -> Nat) (xs : List Nat) :
    (xs.map f).map g = xs.map (g ∘ f) := by
  simp [List.map_map]

-- Challenge 6.3
theorem append_eq_nil (xs ys : List Nat) :
    xs ++ ys = [] ↔ xs = [] ∧ ys = [] := by
  constructor
  · intro h
    simp at h
    exact h
  · intro ⟨hxs, hys⟩
    simp [hxs, hys]

-- Challenge 6.4
theorem specific_computation :
    ([1, 2, 3].map double).reverse = [6, 4, 2] := by
  rfl

end Sol03_Lists
