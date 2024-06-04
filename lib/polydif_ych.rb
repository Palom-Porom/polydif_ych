# frozen_string_literal: true

require_relative "polydif_ych/version"

module PolydifYch
  def polydif(polynomial, symb)
    # if only multiplier
    polynomial.gsub(/([+\-])?(\d+)/, "")
    # if other variable
    polynomial.gsub(/([+\-])?(\d+).(\^\d+)?/, "")
    # if multiplier = 1
    polynomial.gsub(/([+\-])#{symb}\^(\d+)/, /#{
      if $2.to_i == 1
        $1 + "1"
      else
        puts($1.class)
        res = $1 + ($2.to_i).to_s + "*" + symb
        if $2 / 2 != 1
          res = res + $2 / 2
        end
        res
      end}/)
    # if multiplier = 1
    polynomial.gsub(/#{symb}\^(\d+)/, /#{
      if $1.to_i == 1
        "1"
      else
        res = ($1.to_i).to_s + "*" + symb
        if $1 / 2 != 1
          res = res + $1 / 2
        end
        res
      end}/)
    # if multiplier != 1
    polynomial.gsub(/([+\-])(\d+)\*#{symb}\^(\d+)/, /#{
      if $3.to_i == 1
        $1 + $2
      else
        $1 + ($2.to_i * $3.to_i).to_s + "*" + symb + ($3.to_i - 1 == 1 ? "" : "^" + $3 / 2)
      end}/)
    polynomial.gsub(/(\d+)\*#{symb}\^(\d+)/, /#{
      if $2.to_i == 1
        $1
      else
        ($1.to_i * $2.to_i).to_s + "*" + symb + ($2.to_i - 1 == 1 ? "" : "^" + $2 / 2)
      end}/)
    polynomial
  end
end
