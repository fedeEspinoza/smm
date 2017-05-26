class EstadoMedidor < ActiveRecord::Base
  belongs_to :novedad
  belongs_to :user
  before_update :set_consumo_promedio
  before_save :set_periodo
  before_update :set_periodo

  has_many :medidor_estado_medidors, :foreign_key => 'estado_medidor_id', :class_name => 'MedidorEstadoMedidor'
  has_many :medidors, :through => :medidor_estado_medidors

  validates :estado_actual, :presence => { :message => "Debe completar el campo Estado actual" }
  validates :estado_actual, numericality: { only_integer: true, :message => "El campo Estado actual debe ser un valor entero"}

  #Sólo ejecuto estas validaciones si el medidor al que pertenece el estado es de energia reactiva, y se estoy actualizando
  validates :demanda, :presence => { :message => "Debe completar el campo Demanda" }, if: :es_medidor_de_energia_reactiva, on: :update
  validates :demanda, numericality: { only_integer: true, :message => "El campo Demanda debe ser un valor entero"}, if: :es_medidor_de_energia_reactiva, on: :update

  #Verifico si el Medidor al que pertenece el estado, es de energia reactiva
  def es_medidor_de_energia_reactiva
  	medidor_id = MedidorEstadoMedidor.where(estado_medidor_id: self.id).take.medidor_id
    medidor = Medidor.find(medidor_id)
    return medidor.tipo_medidor.codigo == 2
  end

  #Seteo el consumo promedio
  def set_consumo_promedio
    medidor_id = MedidorEstadoMedidor.where(estado_medidor_id: self.id).take.medidor_id
    medidor = Medidor.find(medidor_id)
    self.promedio = medidor.consumo_promedio
  end

  #Seteo el periodo "mes/anio"
  def set_periodo
    self.periodo = "#{self.fecha_medicion.month}/#{self.fecha_medicion.year}"
  end

  #Calculo el consumo para esa toma de estado
  def consumo
    estado_actual - estado_anterior
  end
end
