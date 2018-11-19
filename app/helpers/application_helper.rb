module ApplicationHelper

  MONTHS = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio","Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]

  def options_for_month(selected)
    options_for_select(MONTHS, selected)
  end

  DISTRIBUTORS = ["Aladim", "Arcon", "Aspa", "Cristal", "GAO", "Glaucia","Marco Boni",
                  "Make One","Novo Toque", "Real", "Ricosti", "Rio Vermelho", "Wanderley"]

  def options_for_distributor(selected)
    options_for_select(DISTRIBUTORS, selected)
  end

  PAYMENTS = ["-", "Dinheiro", "Boleto/Dinheiro", "Boleto/Banco", "Cheque"]

  def options_for_payment(selected)
    options_for_select(PAYMENTS, selected)
  end

end
