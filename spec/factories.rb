
FactoryGirl.define do
  factory :institution do
    name "A Test Institution"
    cfid "000"
  end

  factory :department do
    name "TSTD"
    long_name "A Test Department"
    cfid "111"
    association :institution, factory: :institution
  end

  factory :course do
    name "TSTD 101"
    long_name "A Test Course"
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
    current_enrollment 25
    enrollment_limit 30
    course
    instructor
    location
    semester
  end

end
