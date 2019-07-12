module Enumerable
  def tally
    uniq.map { |k| [k, count(k)] }.to_h
  end
end
