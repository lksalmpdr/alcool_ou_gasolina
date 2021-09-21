//
//  ViewController.swift
//  Álcool ou Gasolina
//
//  Created by Pedro Lucas de Almeida on 11/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func validaCampos (_ campo1 : String, _ campo2 : String) -> Bool {
        var validacao = true
        
        if campo1.isEmpty {
            validacao = false
        }else if campo2.isEmpty {
            validacao = false
        }
        
        return validacao
    }
    
    func alcoolMelhor (_ precoAlcool : Double, _ precoGasolina : Double) ->Bool {
        
        var melhorAlcool = true
        
        if (precoAlcool / precoGasolina >= 0.7){
            melhorAlcool = false
        }
        
        return melhorAlcool
    }
    
    @IBOutlet var precoAlcool: UITextField?
    @IBOutlet var precoGasolina: UITextField?
    @IBOutlet var resultadoLabel: UILabel?
    @IBAction func calcular(_ sender: Any) {
        
        let validacaoCampos = self.validaCampos(precoAlcool?.text ?? "", precoGasolina?.text ?? "")
        
        if (validacaoCampos){
            resultadoLabel?.text = "Digite os valores primeiro!"
        }else{
            let vlrPrecoAlcool = Double(precoAlcool?.text ?? "") ?? 0.0
            let vlrPrecoGasolina = Double(precoGasolina?.text ?? "") ?? 1.0
            
            let melhorAlcool = self.alcoolMelhor(vlrPrecoAlcool, vlrPrecoGasolina)
            
            if (!melhorAlcool){
                resultadoLabel!.text = "Melhor usar a GASOLINA"
            }else{
                resultadoLabel!.text = "Melhor usar o ÁLCOOL"
            }
            
        }
    }
    
}

