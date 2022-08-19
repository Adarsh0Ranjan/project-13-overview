//
//  ContentView.swift
//  project-13-concepts
//
//  Created by Roro Solutions on 16/08/22.
//
import SwiftUI
struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false

    @State private var inputImage: UIImage?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
        Button("Save Image") {
            guard let inputImage = inputImage else { return }

            let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: inputImage)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
    }
}
//lecture-4-Integrating Core Image with SwiftUI

//import CoreImage
//import CoreImage.CIFilterBuiltins
//import SwiftUI
//struct ContentView: View {
//    @State private var image: Image?
//
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
//    }
//
//    func loadImage() {
//        guard let inputImage = UIImage(named: "Example") else { return }
//        let beginImage = CIImage(image: inputImage)
//
//        let context = CIContext()
//        let currentFilter =  .sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1 //intensity is how strongly the sepia effect should be applied, specified in the range 0 (original image) and 1 (full sepia).
//
////        let currentFilter = CIFilter.pixellate()
////        currentFilter.inputImage = beginImage
////        currentFilter.scale = 100
//
////        let currentFilter = CIFilter.crystallize()
////        currentFilter.inputImage = beginImage
////        currentFilter.radius = 200
//
////        let currentFilter = CIFilter.twirlDistortion()
////        currentFilter.inputImage = beginImage
////        currentFilter.radius = 1000
////        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
//
//
//        /*now you can see wheber we are  changing the filter we are also chnaging their property like for "sepiaTone we need  intensity, for pixellate we need scale for twillDistortion we need radius and ceter"  so thsis irritating sow swift ui comes up wth a solution which is common for all let dve into it */
//
//        let amount = 1.0
//
//        let inputKeys = currentFilter.inputKeys
//
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
//        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
//        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
//         // if you wnat to add some more property you choose on bais of your use
//
//        //None of this is terribly hard, but here’s where that changes: we need to convert the output from our filter to a SwiftUI Image that we can display in our view.
//
//        // get a CIImage from our filter or exit if that fails
//        guard let outputImage = currentFilter.outputImage else { return }
//        // attempt to get a CGImage from our CIImage
//        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            // convert that to a UIImage
//            let uiImage = UIImage(cgImage: cgimg)
//
//            // and convert that to a SwiftUI image
//            image = Image(uiImage: uiImage)
//        }
//    }
//}

//lecture-3-Showing multiple options with confirmationDialog() -> more of similar as alert but gaive more options than alert
//struct ContentView: View {
//    @State private var showingConfirmation = false
//    @State private var backgroundColor = Color.white
//
//    var body: some View {
//        Text("Hello, World!")
//            .frame(width: 300, height: 300)
//            .background(backgroundColor)
//            .onTapGesture {
//                showingConfirmation = true
//            }
//            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
//                Button("Red") { backgroundColor = .red }
//                Button("Green") { backgroundColor = .green }
//                Button("Blue") { backgroundColor = .blue }
//                Button("Cancel", role: .cancel) { }
//            } message: {
//                Text("Select a new color")
//            }
//    }
//}

// lecture-2-Responding to state changes using onChange()
//struct ContentView: View {
//    @State private var blurAmount: CGFloat = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20)
//               .onChange(of: blurAmount) { newValue in  // you can put this onChnage at bottom like navigation title
//                print("New value is \(newValue)")
//            }
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20) // here whole blur amount getting set
//            }
//
//        }
//    }
//}


//leture-1-How property wrappers become structs
//struct ContentView: View {
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)") // this will only  get print in case of when blur amount is changed by butoon but if we change it by slider this will not get printed because on that case $blurAmount get cahanged not blurAmount changes. we will see the solution in lecture-2
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20) // $blueamount is getting set and whole blur amount
//
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20) // here whole blur amount getting set
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
