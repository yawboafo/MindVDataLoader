# MindVDataLoader
A simple networking layer for downloading any form of Data asynchronously.

## Installations
Drag and drop or add the **MindVDataLoader** folder into your application or add the **MindVDataLoader.framework**  as a framework.


## Configure Max Memory Capacity
```swift
 var mcache = MUrlCache()
 mcache.configureMaxmemoryLimit(maxMemoryLimit: 90)
```

## Use Library
```swift
 let dataLoader = MOperationManager()
 dataLoader.loadData(urlString: "www.imageUrl.com") { data in
          
//Data here you can use       
    }
```

### Data download Operation Response Data structure 

`loadData`  returns a  `MOperationResponse(error as AnyObject,data as Data,response as AnyObject)`  


## Use Library to download Image and set to UIImageView using extensions
```swift
private let dataLoader = MOperationManager()
extension UIImageView {
    func setImage(url: String){
         dataLoader.loadData(urlString: url) { data in
        if let  _image = UIImage(data: data.data ?? Data()) {
                //this should be on mainthred
                self.image = _image
              }
        }
        
    } 
    
}
```

You can then use your extension like this `yourimageview.setImage(url: "yourimageurl")`


### The test project can be found here  [Example project](https://github.com/yawboafo/MindValleyMobileTest.git)
