require 'csv'

helpers do
  def to_percent(partial, total)
    ((partial / total.to_f) * 100).round(2)
  end

  def write_tsv(question)
    CSV.open("public/data/results.tsv", "w", { :col_sep => "\t" }) do |csv|
      csv << ["name", "value"]
        question.choices.each do |choice|
          csv << [choice.text, choice.answers.length]
        end
    end
  end
end