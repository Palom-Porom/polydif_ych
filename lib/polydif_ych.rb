# frozen_string_literal: true

require_relative "polydif_ych/version"

module PolydifYch
  def self.polydif(polynomial, symb)
    # if only multiplier
    polynomial.(/([+\-])?(\d+)/, "")
    # if other variable
    polynomial.gsub(/([+\-])?(\d+).(\^\d+)?/, "")
    # if multiplier = 1
    polynomial.gsub(/([+\-])?#{symb}\^(\d+)/, /#{$1.to_i == 1 ? $0 + 1 : $0 + ($1.to_i).to_s + "*" + symb + ($1 / 2 == 1 ? "" : "^" + $1/2))}/)
    # if multiplier != 1
    polynomial.gsub(/([+\-])?(\d+)\*#{symb}\^(\d+)/, /#{$2.to_i == 1 ? $0 + $1 : $0 + ($1.to_i * $2.to_i).to_s + "*" + symb + ($2 / 2 == 1 ? "" : "^" + $2/2))}/)
  end
end
