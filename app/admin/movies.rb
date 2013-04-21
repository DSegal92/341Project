ActiveAdmin.register Movie do
  form do |f|
		f.inputs do
			f.input :title
			f.input :rating
			f.input :genre
			f.input :year
			f.input :description
			f.input :directors
		end
		f.buttons
	end 
end
