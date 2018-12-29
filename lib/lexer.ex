defmodule Capelo.FrenchLexer do
  use LexLuthor

  defrule ~r/^«/u,                          fn(_) -> :PRE_DIALOG end
  defrule ~r/^ /u,      :PRE_DIALOG,        fn(_) -> :DIALOG end
  defrule ~r/^\n/u,   :DIALOG,              fn(_) -> :DIALOG_FIRST_CUT end
  defrule ~r/^\n+?/u, :DIALOG_FIRST_CUT,    fn(_) -> :DIALOG_SECOND_CUT end
  defrule ~r/^—\s/u, :DIALOG_SECOND_CUT,    fn(_) -> :DIALOG end
  defrule ~r/^[^ \n»]+/u, :DIALOG,        fn(e) -> {:dialog, e} end
  defrule ~r/^ /u,      :DIALOG,            fn(_) -> :DIALOG_FINE_SPACE end
  defrule ~r/^[^\n»]+/u,  :DIALOG_FINE_SPACE, fn(_) -> :DIALOG end
  defrule ~r/^»/u,      :DIALOG_FINE_SPACE, fn(_) -> nil end
end
