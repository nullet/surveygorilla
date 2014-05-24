helpers do
  def to_percent(partial, total)
    ((partial / total.to_f) * 100).round(2)
  end
end