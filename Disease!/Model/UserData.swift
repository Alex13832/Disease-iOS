//
//  UserData.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import Combine
import SwiftUI
import CoreML

final class UserData: ObservableObject {
    
    @Published var choices: Set = Set<String>()
    @Published var searchText: String = ""
    @Published var selected: [String: Bool] = [:]
    @Published var accuracy: Double = 0.0
    @Published var disease_label: String = ""
        
    // Initializes the disease prediction model.
    let model: DiseaseSymptomPrediction = {
        do {
            let config = MLModelConfiguration()
            return try DiseaseSymptomPrediction(configuration: config)
        } catch {
            print(error)
            fatalError("Couldn't create DiseaseSymptomPrediction model.")
        }
    }()
    
    /**
     Inserts a choice into choices array.
     - parameter choice: A string value that is a symptom that is to be inserted.
     */
    func insertChoice(choice: String) -> Void {
        choices.insert(choice)
    }
    
    /**
     Removes a symptom from the choices array.
     - parameter choice: A string value that is a symptom to be removed.
     */
    func removeChoice(choice: String) -> Void {
        choices.remove(choice)
    }

    /**
     Checks if the symptoms array contains the choice.
     - parameter choice: The string to check.
     */
    func containsChoice(choice: String) -> Bool {
        return choices.contains(choice)
    }
    
    /**
     Resets data.
     */
    func clearChoices() -> Void {
        choices.removeAll()
        selected.removeAll()
        accuracy = 0.0
    }
    
    /**
     Predicts the disease by taking the symptoms as input.
     */
    func predictDisease() -> Void {
        if choices.count < 3 || choices.count > 16 {
            return
        }
        // Needs to be sorted, that's the way the model was trained.
        var symptoms = Array(choices).sorted()
        
        // All ' ' must be replaced with '_'
        for i in 0...symptoms.count - 1 {
            symptoms[i] = symptoms[i].lowercased()
            symptoms[i] = symptoms[i].replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        }
        // z is a "don't care" symptom in the model prediction.
        for _ in symptoms.count...17 {
            symptoms.append("z")
        }
        // Predicts the disease.
        let input = DiseaseSymptomPredictionInput(Symptom_1: symptoms[0], Symptom_2: symptoms[1],
                                                  Symptom_3: symptoms[2], Symptom_4: symptoms[3],
                                                  Symptom_5: symptoms[4], Symptom_6: symptoms[5],
                                                  Symptom_7: symptoms[6], Symptom_8: symptoms[7],
                                                  Symptom_9: symptoms[8], Symptom_10: symptoms[9],
                                                  Symptom_11: symptoms[10], Symptom_12: symptoms[11],
                                                  Symptom_13: symptoms[12], Symptom_14: symptoms[13],
                                                  Symptom_15: symptoms[14], Symptom_16: symptoms[15],
                                                  Symptom_17: symptoms[16])
        
        
        // Final steps, get the accuracy and the label.
        do {
            let disease = try model.prediction(input: input)
            var max_value = 0.0
            
            for disease in disease.DiseaseProbability {
                if disease.value > max_value {
                    max_value = disease.value
                }
            }
            // Done!
            disease_label = disease.Disease
            accuracy = max_value
            print(disease_label)
        } catch {
            print("Failed predicting disease.")
        }
    }
}
