module PriceLevelAssociationDeletion
  private

    def delete_price_level_associations
      brand.locations.each do |location|
        location.price_level_associations.where(model_name.singular_route_key => self).destroy_all
      end
    end

end
