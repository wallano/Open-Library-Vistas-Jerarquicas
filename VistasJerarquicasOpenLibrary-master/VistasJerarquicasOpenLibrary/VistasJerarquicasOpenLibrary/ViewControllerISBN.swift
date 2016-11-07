//
//  ViewControllerISBN.swift
//  VistasJerarquicasOpenLibrary
//
//  Created by Walter Llano on 05/11/16.
//  Copyright © 2016 Walter Llano. All rights reserved.
//

import UIKit

class ViewControllerISBN: UIViewController
{
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Vista ISBN")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertaDeError()
    {
        let alerta = UIAlertController(title: "Error de conexión", message: "Ha habido un error al tratar de obtener la información relacionada al ISBN. Verifica tu conexión a internet.", preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            alerta.dismiss(animated: true, completion: nil)
        }))
        
        present(alerta, animated: true, completion: nil)
    }
    
    func sinResultados()
    {
        let alerta = UIAlertController(title: "Búsqueda sin resultados", message: "No existe información para el ISBN que ingreso. Haga el intento con otro diferente", preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            alerta.dismiss(animated: true, completion: nil)
        }))
        
        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func buscarISBN(_ sender: UITextField)
    {
        self.resignFirstResponder()
        
        var cadenaISBN : String
        var autores : String = "Sin autores"
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:";
        let url = URL(string: urls + sender.text!)
        let datos : Data? = try? Data(contentsOf: url!)
        cadenaISBN = "ISBN:" + sender.text!
        
        if(datos != nil)
        {
            let jsonUTF8 = NSString(data:datos!, encoding: String.Encoding.utf8.rawValue)
            print(jsonUTF8)
            do
            {
                let json = try JSONSerialization.jsonObject(with: datos!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                let dic1 = json as! NSDictionary
                print(dic1.allKeys.count)
                
                if dic1.allKeys.count == 0
                {
                    print("Sin resultados")
                    sinResultados()
                }
                else
                {
                    //ISBN
                    let dic2 = dic1[cadenaISBN] as! NSDictionary
                
                    if dic2["authors"] != nil
                    {
                        //Autores
                        let dic4 = dic2["authors"] as! NSArray
                    
                        for i in 0 ..< dic4.count
                        {
                            let dic5 = dic4[i] as! NSDictionary
                        
                            if i == 0
                            {
                                autores = dic5["name"] as! NSString as String
                            }
                            else
                            {
                                autores = autores + "\n" + (dic5["name"] as! NSString as String)
                            }
                        }
                    }
                    print(autores)
                
                    //Cover
                    let dicCover = dic2["cover"]
                    var portada = ""
                    print(dicCover)
                    if dicCover != nil
                    {
                        let cover = dicCover as! NSDictionary
                        //print(cover)
                    
                        portada = cover["medium"] as! NSString as String
                    }
                
                    let titulo = dic2["title"] as! NSString as String
                    libros.append(Libro(titulo: titulo, autores: autores, portada: portada, isbn: sender.text!))
                    
                    //Este hace referencia al Storyboard
                    let miStoryBoard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
                    //Asociación de la vista al Story Board
                    let vista = miStoryBoard.instantiateViewController(withIdentifier: "titulosView") as! TableViewControllerMaster
                    //Se envía el control a la vista
                    self.navigationController!.pushViewController(vista, animated: true)
                }
            }
            catch _{}
        }
        else
        {
            alertaDeError()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
