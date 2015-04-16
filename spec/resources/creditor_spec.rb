require 'spec_helper'

describe GoCardless::Resources::Creditor do
  describe "initialising" do
    let(:data) do
      {
      
        
          "address_line1" => "address_line1-input",
        
      
        
          "address_line2" => "address_line2-input",
        
      
        
          "address_line3" => "address_line3-input",
        
      
        
          "city" => "city-input",
        
      
        
          "country_code" => "country_code-input",
        
      
        
          "created_at" => "created_at-input",
        
      
        
          "id" => "id-input",
        
      
        
        "links" => {
          
            "default_eur_payout_account" => "default_eur_payout_account-input",
          
            "default_gbp_payout_account" => "default_gbp_payout_account-input",
          
            "logo" => "logo-input",
          
        },
        
      
        
          "name" => "name-input",
        
      
        
          "postal_code" => "postal_code-input",
        
      
        
          "region" => "region-input",
        
      
      }
    end

    it "can be initialized from an uneveloped response" do
      resource = described_class.new(data)
      
       
       expect(resource.address_line1).to eq("address_line1-input")
       
       
       
       expect(resource.address_line2).to eq("address_line2-input")
       
       
       
       expect(resource.address_line3).to eq("address_line3-input")
       
       
       
       expect(resource.city).to eq("city-input")
       
       
       
       expect(resource.country_code).to eq("country_code-input")
       
       
       
       expect(resource.created_at).to eq("created_at-input")
       
       
       
       expect(resource.id).to eq("id-input")
       
       
       
         
           expect(resource.links.default_eur_payout_account).to eq("default_eur_payout_account-input")
         
           expect(resource.links.default_gbp_payout_account).to eq("default_gbp_payout_account-input")
         
           expect(resource.links.logo).to eq("logo-input")
         
       
       
       
       expect(resource.name).to eq("name-input")
       
       
       
       expect(resource.postal_code).to eq("postal_code-input")
       
       
       
       expect(resource.region).to eq("region-input")
       
       
    end

    describe "#to_h" do
      it "returns a hash representing the resource" do
        expect(described_class.new(data).to_h).to eq(data)
      end
    end
  end
end

