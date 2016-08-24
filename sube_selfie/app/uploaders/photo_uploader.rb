class PhotoUploader < CarrierWave::Uploader::Base
  # ...
  include CarrierWave::MiniMagick

  def store_dir
    # Como y donde guardar el archivo ...
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    #crea la carpeta uploads en public y la sub carpeta photo(nombre de la clase), con otra carpeta dentro
    #y luego una dentro con el id de la photo donde por fin está la foto
    #de este modo no se sobreescriben
  end

  # Que tipo de storage usará este uploader
  storage :file #guarda la información

  # Versiones del archivo ...
  #version :print do
  #  version :thumb   do   process resize_to_fit: [32, 32]     end
  #  version :preview do   process resize_to_fit: [256, 256]   end
  #  version :full    do   process resize_to_fit: [2048, 2048] end
  #end

  #version :web do                              #Tamaño
    version :thumb   do process resize_to_fit: [600, 600]     end
    version :preview do process resize_to_fit: [128, 128]     end
    version :full    do process resize_to_fit: [1024, 768]    end
  #end

  def extension_white_list
    #Que extensiones vas a aceptar
    %w(jpg jpeg gif png)
  end
end