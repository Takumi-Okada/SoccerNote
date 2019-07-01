module MembersHelper
     #年齢を返す（birthdayが登録されていない場合はnilを返す）
     def age(birthday)
        begin
            date_format="%Y%m%d"
            (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i)/10000
        rescue => exception
            nil
        end
    end
end
