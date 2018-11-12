module ApplicationHelper

  MESES = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio","Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]

  def options_for_month(selected)
    options_for_select(MESES, selected)
  end

  DISTRIBUIDORAS = ["Aladim", "Arcon", "Aspa", "Cristal", "GAO", "Glaucia","Marco Boni",
                  "Make One","Novo Toque", "Real", "Ricosti", "Rio Vermelho", "Wanderley"]

  def options_for_distributor(selected)
    options_for_select(DISTRIBUIDORAS, selected)
  end

end
