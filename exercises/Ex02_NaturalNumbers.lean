/-
  Exercise 02: Natural Number Proofs
  ===================================

  This file explores proofs about natural numbers (Nat).
  Key tactics introduced:
  - `induction` : Prove by mathematical induction
  - `rw` (rewrite): Replace equals with equals
  - `ring` : Solve ring equations automatically

  Natural numbers in Lean: 0, 1, 2, ... (non-negative integers)
  Defined inductively as: Nat.zero or Nat.succ n

  Difficulty: Beginner to Intermediate
-/

namespace Ex02_NaturalNumbers

/-
  SECTION 1: Basic Properties of Addition
  ---------------------------------------
  These properties can often be proven with `rfl`, `simp`, or `rw`.
-/

-- Exercise 1.1: Zero is a right identity for addition
theorem add_zero (n : Nat) : n + 0 = n := by
  sorry

-- Exercise 1.2: Zero is a left identity for addition
-- Hint: Try `simp` or `rfl`
theorem zero_add (n : Nat) : 0 + n = n := by
  sorry

-- Exercise 1.3: Adding 1 gives the successor
-- Note: Nat.succ n is the successor of n (i.e., n + 1)
theorem add_one (n : Nat) : n + 1 = Nat.succ n := by
  sorry

/-
  SECTION 2: Commutativity and Associativity
  ------------------------------------------
  These are fundamental properties of addition.
  They may require induction or library lemmas.
-/

-- Exercise 2.1: Addition is commutative
-- Hint: Try `Nat.add_comm` or `omega`
theorem add_comm (m n : Nat) : m + n = n + m := by
  sorry

-- Exercise 2.2: Addition is associative
-- Hint: Try `Nat.add_assoc` or `omega`
theorem add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  sorry

-- Exercise 2.3: Rearranging terms
-- Hint: Use `omega` or combine commutativity and associativity
theorem add_rearrange (a b c : Nat) : a + b + c = c + b + a := by
  sorry

/-
  SECTION 3: Simple Induction
  ---------------------------
  Mathematical induction is the key proof technique for Nat.
  To prove P(n) for all n:
  - Base case: Prove P(0)
  - Inductive step: Assume P(k), prove P(k+1)
-/

-- A simple recursive function for our proofs
def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) + sumTo n

-- Exercise 3.1: sumTo 0 equals 0
-- Hint: This follows from the definition
theorem sumTo_zero : sumTo 0 = 0 := by
  sorry

-- Exercise 3.2: sumTo 1 equals 1
theorem sumTo_one : sumTo 1 = 1 := by
  sorry

-- Exercise 3.3: sumTo 3 equals 6 (1 + 2 + 3)
theorem sumTo_three : sumTo 3 = 6 := by
  sorry

/-
  SECTION 4: Multiplication Properties
  ------------------------------------
  Similar properties hold for multiplication.
-/

-- Exercise 4.1: Multiplying by zero gives zero
theorem mul_zero (n : Nat) : n * 0 = 0 := by
  sorry

-- Exercise 4.2: Multiplying by one gives the same number
theorem mul_one (n : Nat) : n * 1 = n := by
  sorry

-- Exercise 4.3: Zero times anything is zero
theorem zero_mul (n : Nat) : 0 * n = 0 := by
  sorry

-- Exercise 4.4: Multiplication distributes over addition (left)
-- Hint: Try `Nat.mul_add` or `ring`
theorem mul_add_distrib (a b c : Nat) : a * (b + c) = a * b + a * c := by
  sorry

/-
  SECTION 5: Inequalities
  -----------------------
  Lean uses `Nat.le` for less-than-or-equal (<=)
  and `Nat.lt` for strictly less-than (<).
-/

-- Exercise 5.1: Every number is less than or equal to itself
-- Hint: Try `Nat.le_refl` or `omega`
theorem le_refl (n : Nat) : n <= n := by
  sorry

-- Exercise 5.2: Zero is less than or equal to any number
-- Hint: Try `Nat.zero_le` or `omega`
theorem zero_le (n : Nat) : 0 <= n := by
  sorry

-- Exercise 5.3: If a <= b then a <= b + c
-- Hint: Try `omega` or `Nat.le_add_right`
theorem le_add_right (a b c : Nat) (h : a <= b) : a <= b + c := by
  sorry

/-
  SECTION 6: Challenge Problems
  -----------------------------
  These require combining multiple techniques.
-/

-- Challenge 6.1: Double of a number using addition
def double (n : Nat) : Nat := n + n

theorem double_eq_two_mul (n : Nat) : double n = 2 * n := by
  sorry

-- Challenge 6.2: A number is less than its successor
-- Hint: Try `Nat.lt_succ_self` or `omega`
theorem lt_succ_self (n : Nat) : n < n + 1 := by
  sorry

-- Challenge 6.3: The sum formula (Gauss's formula)
-- sumTo n = n * (n + 1) / 2
-- Note: We use 2 * sumTo n = n * (n + 1) to avoid division
-- Hint: This requires induction and arithmetic reasoning
theorem sumTo_formula (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  sorry

end Ex02_NaturalNumbers
