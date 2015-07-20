(** * Interface to the Big_int library. *)
Require Import Coq.ZArith.ZArith.

(** The OCaml's `big_int` type. *)
Parameter t : Type.
Extract Constant t => "Big_int.big_int".

Parameter to_Z_aux : forall {Z positive : Type},
  t ->
  Z -> (positive -> Z) -> (positive -> Z) ->
  positive -> (positive -> positive) -> (positive -> positive) ->
  Z.
Extract Constant to_Z_aux => "ExtractionBigInt.to_Z_aux".

(** Export to a `Z`. *)
Definition to_Z (big : t) : Z :=
  to_Z_aux big Z0 Zpos Zneg xH xO xI.
