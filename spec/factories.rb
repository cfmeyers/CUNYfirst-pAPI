
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

  factory :instructor do
    last_name "Smith"
    first_name "Melvin"
    cfid "123"
  end


  factory :section do
    cfid "333"
    start_time "10:00"
    end_time "11:00"
    # association :course, factory: :course
    course
    instructor
    location
    semester
  end

end
