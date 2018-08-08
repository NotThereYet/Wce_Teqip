class Proposal < ApplicationRecord
	mount_uploader :attachment, DocUploader
end
