class EntryForm
    include ActiveModel::Model
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    def persisted?
      false
    end

    # Check for non-empty object
    validate :not_empty

    def initialize(data)
        @data = data
        @stats = {
            entrants: {
                created: 0,
                updated: 0,
                invalid: 0
            },
            entries: {
                created: 0,
                updated: 0,
                invalid: 0
            }
        }
        @entries = []
        @entrants = []
    end

    def process
        # For each GUID
        @data.each do | guid, value | 
            # Process Entrant
            entrant = Entrant.find_or_initialize_by(guid: guid)
            if entrant.new_record?
                entrant.name = value[:entrant][:name]
                entrant.phone = value[:entrant][:phone]
                entrant.email = value[:entrant][:email]
                entrant.birthdate = value[:entrant][:birthdate]
                entrant.street_address = value[:entrant][:street_address]
                entrant.zipcode = value[:entrant][:zipcode]
                if entrant.save
                    @stats[:entrants][:created] += 1
                    @entrants.push(entrant)
                else
                    @stats[:entrants][:invalid] += 1
                end
            else
                entrant.update(name: value[:entrant][:name], 
                    phone: value[:entrant][:phone], 
                    email: value[:entrant][:email], 
                    birthdate: value[:entrant][:birthdate],
                    street_address: value[:entrant][:street_address],
                    zipcode: value[:entrant][:zipcode])
                if entrant.valid? 
                    @stats[:entrants][:updated] += 1
                    @entrants.push(entrant)
                else
                    @stats[:entrants][:invalid] += 1
                end
            end

            # Process Entry
            entry = Entry.find_or_initialize_by(entrant_guid: guid)
            if entry.new_record?
                entry.s3_uri = value[:entry][:s3_uri]
                entry.date_created = value[:entry][:date_created]
                entry.entrant_id = entrant.id
                if entry.save
                    entry.queue_processing
                    @stats[:entries][:created] += 1
                    @entries.push(entry)
                else
                    @stats[:entries][:invalid] += 1
                end
            else
                entry.update(s3_uri: value[:entry][:s3_uri],
                    date_created: value[:entry][:date_created], entrant_id: entrant.id)
                if entry.valid?
                    entry.queue_processing
                    @stats[:entries][:updated] += 1
                    @entries.push(entry)
                else
                    @stats[:entries][:invalid] += 1
                end
            end
        end
    end

    def result
        {
            entries: @entries,
            entrants: @entrants,
            stats: @stats
        }
    end

    # Validations
    def not_empty
        if @data.length == 0
            errors.add :base, "Empty object"
        end
    end
end