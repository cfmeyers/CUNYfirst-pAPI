
FactoryGirl.define do
  factory :institution do
    name "A Test Institution"
    cfid "000"
  end

  factory :department do
    name "A Test Department"
    cfid "111"
    association :institution, factory: :institution
  end

  factory :course do
    name "A Test Course"
    cfid "222"
    association :department, factory: :department
  end

  factory :section do
    cfid "333"
    association :course, factory: :course
  end
end
