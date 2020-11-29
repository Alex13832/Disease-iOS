//
//  ButtonGrid.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct Content: Identifiable {
    var id = UUID()
    var text: String
}

struct ButtonGrid: View {
    var searchText: String
    @EnvironmentObject private var userData: UserData
    
    let buttons = [
        Content(text: "Abdominal pain"),
        Content(text: "Abnormal menstruation"),
        Content(text: "Acidity"),
        Content(text: "Acute liver failure"),
        Content(text: "Altered sensorium"),
        Content(text: "Anxiety"),
        Content(text: "Back pain"),
        Content(text: "Belly pain"),
        Content(text: "Blackheads"),
        Content(text: "Bladder discomfort"),
        Content(text: "Blister"),
        Content(text: "Blood in sputum"),
        Content(text: "Bloody stool"),
        Content(text: "Blurred and distorted vision"),
        Content(text: "Breathlessness"),
        Content(text: "Brittle nails"),
        Content(text: "Bruising"),
        Content(text: "Burning micturition"),
        Content(text: "Chest pain"),
        Content(text: "Chills"),
        Content(text: "Cold hands and feets"),
        Content(text: "Coma"),
        Content(text: "Congestion"),
        Content(text: "Constipation"),
        Content(text: "Continuous feel of urine"),
        Content(text: "Continuous sneezing"),
        Content(text: "Cough"),
        Content(text: "Cramps"),
        Content(text: "Dark urine"),
        Content(text: "Dehydration"),
        Content(text: "Depression"),
        Content(text: "Diarrhoea"),
        Content(text: "Dischromic patches"),
        Content(text: "Distention of abdomen"),
        Content(text: "Dizziness"),
        Content(text: "Drying and tingling lips"),
        Content(text: "Enlarged thyroid"),
        Content(text: "Excessive hunger"),
        Content(text: "Extra marital contacts"),
        Content(text: "Family history"),
        Content(text: "Fast heart rate"),
        Content(text: "Fatigue"),
        Content(text: "Fluid overload"),
        Content(text: "Fluid overload"),
        Content(text: "Foul smell ofurine"),
        Content(text: "Headache"),
        Content(text: "High fever"),
        Content(text: "Hip joint pain"),
        Content(text: "History of alcohol consumption"),
        Content(text: "Increased appetite"),
        Content(text: "Indigestion"),
        Content(text: "Inflammatory nails"),
        Content(text: "Internal itching"),
        Content(text: "Irregular sugar level"),
        Content(text: "Irritability"),
        Content(text: "Irritation in anus"),
        Content(text: "Itching"),
        Content(text: "Joint pain"),
        Content(text: "Knee pain"),
        Content(text: "Lack of concentration"),
        Content(text: "Lethargy"),
        Content(text: "Loss of appetite"),
        Content(text: "Loss of balance"),
        Content(text: "Loss of smell"),
        Content(text: "Malaise"),
        Content(text: "Mild fever"),
        Content(text: "Mood swings"),
        Content(text: "Movement stiffness"),
        Content(text: "Mucoid sputum"),
        Content(text: "Muscle pain"),
        Content(text: "Muscle wasting"),
        Content(text: "Muscle weakness"),
        Content(text: "Nausea"),
        Content(text: "Neck pain"),
        Content(text: "Nodal skin eruptions"),
        Content(text: "Obesity"),
        Content(text: "Pain behind the eyes"),
        Content(text: "Pain during bowel movements"),
        Content(text: "Pain in anal region"),
        Content(text: "Painful walking"),
        Content(text: "Palpitations"),
        Content(text: "Passage of gases"),
        Content(text: "Patches in throat"),
        Content(text: "Phlegm"),
        Content(text: "Polyuria"),
        Content(text: "Prognosis"),
        Content(text: "Prominent veins on calf"),
        Content(text: "Puffy face and eyes"),
        Content(text: "Pus filled pimples"),
        Content(text: "Receiving blood transfusion"),
        Content(text: "Receiving unsterile injections"),
        Content(text: "Red sore around nose"),
        Content(text: "Red spots over body"),
        Content(text: "Redness of eyes"),
        Content(text: "Restlessness"),
        Content(text: "Runny nose"),
        Content(text: "Rusty sputum"),
        Content(text: "Scurring"),
        Content(text: "Shivering"),
        Content(text: "Silver like dusting"),
        Content(text: "Sinus pressure"),
        Content(text: "Skin peeling"),
        Content(text: "Skin rash"),
        Content(text: "Slurred speech"),
        Content(text: "Small dents in nails"),
        Content(text: "Spinning movements"),
        Content(text: "Spotting urination"),
        Content(text: "Stiff neck"),
        Content(text: "Stomach bleeding"),
        Content(text: "Stomach pain"),
        Content(text: "Sunken eyes"),
        Content(text: "Sweating"),
        Content(text: "Swelled lymph nodes"),
        Content(text: "Swelling joints"),
        Content(text: "Swelling of stomach"),
        Content(text: "Swollen blood vessels"),
        Content(text: "Swollen extremeties"),
        Content(text: "Swollen legs"),
        Content(text: "Throat irritation"),
        Content(text: "Toxic look (typhos)"),
        Content(text: "Ulcers on tongue"),
        Content(text: "Unsteadiness"),
        Content(text: "Visual disturbances"),
        Content(text: "Vomiting"),
        Content(text: "Watering from eyes"),
        Content(text: "Weakness in limbs"),
        Content(text: "Weakness of one body side"),
        Content(text: "Weight gain"),
        Content(text: "Weight loss"),
        Content(text: "Yellow crust ooze"),
        Content(text: "Yellow urine"),
        Content(text: "Yellowing of eyes"),
        Content(text: "Yellowish skin")
    ]
    
    var body: some View {
        ForEach(buttons) { content in
            
            if content.text.lowercased().contains(self.searchText.lowercased()) || self.searchText == "" {
                CustomButton(labelText: "\(content.text)")
            }
            

        }
        .environmentObject(UserData())
    }
}