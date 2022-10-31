def get_user_specific_cta_data_v1(user_kyc_profile, _params)

    if user_kyc_profile.id_status.present? &&
       user_kyc_profile.id_status != 'rejected' && 
        user_kyc_profile.address_status.present? && 
        user_kyc_profile.address_status != 'rejected' &&
        user_kyc_profile.user_details['name'].present?
      return selfie_verification_continue_data
    end

    if user_kyc_profile.id_status.present? && 
       user_kyc_profile.id_status != 'rejected' && 
       user_kyc_profile.address_status.present? && 
      user_kyc_profile.address_status != 'rejected' && 
      user_kyc_profile.facial_status.blank? && 
      user_kyc_profile.user_details['name'].blank?
      return details_verification_continue_data_v1
    end

    if user_kyc_profile.id_status.present? && 
       user_kyc_profile.id_status != 'rejected'
      return address_verification_continue_data
    end

    return identity_verification_continue_data 

    {}
  end
