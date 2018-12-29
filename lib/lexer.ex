defmodule Capelo.FrenchLexer do
  use LexLuthor

  defrule ~r/^#/u, fn(_) -> :PRE_TITLE end
  defrule ~r/^ /u, :PRE_TITLE, fn(_) -> :TITLE end
  defrule ~r/^[^\n]+/u, :TITLE, fn(e) -> {:title, e} end
  defrule ~r/^\n/u, :TITLE, fn(_) -> :default end

  # Ignore \n when not in state.
  defrule ~r/^\n/u, fn(_) -> :default end
  defrule ~r/^./u, fn(_) -> :default end

end
