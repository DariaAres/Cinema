class GoodnessValidator < ActiveModel::Validator
    def validate(record)
      binding.pry
      if record.first_name == "Evil"
        record.errors.add :base, "This person is evil"
      end
    end
  end