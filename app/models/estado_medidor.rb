class EstadoMedidor < ActiveRecord::Base
  belongs_to :novedad
  belongs_to :user

  has_many :medidor_estado_medidors, :foreign_key => 'estado_medidor_id', :class_name => 'MedidorEstadoMedidor'
  has_many :medidors, :through => :medidor_estado_medidors

  validates :estado_actual, :presence => { :message => "Debe completar el campo Estado actual" }
  validates :estado_actual, numericality: { only_integer: true, :message => "El campo Estado actual debe ser un valor entero"}
  #Sólo ejecuto estas validaciones si el medidor al que pertenece el estado es de energia reactiva
  validates :demanda, :presence => { :message => "Debe completar el campo Demanda" }, if: :medidor_de_energia_reactiva
  validates :demanda, numericality: { only_integer: true, :message => "El campo Demanda debe ser un valor entero"}, if: :medidor_de_energia_reactiva

  #Verifico si el Medidor al que pertenece el estado, es de energia reactiva
  def medidor_de_energia_reactiva
  	medidor_id = MedidorEstadoMedidor.where(estado_medidor_id: self.id).take.medidor_id
    medidor = Medidor.find(medidor_id)
    return medidor.tipo_medidor.codigo == 2
  end
end
