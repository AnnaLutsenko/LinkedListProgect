//
//  main.swift
//  listTest
//
//  Created by Vitalii Boiarskyi on 4/28/17.
//  Copyright © 2017 Vitalii Boiarskyi. All rights reserved.
//

import Foundation

class List //: CustomStringConvertible
{
    var value: String?;
    var next : List?
    
    var count : Int
    {
        var currentList : List = self
        var currentIndex = self.value != nil ? 1 : 0
        while (currentList.next != nil)
        {
            currentList = currentList.next!
            currentIndex += 1
        }
        return currentIndex
    }
    
    
    
    func append(value : String)
    {
        var currentList:List = self
        while  currentList.next != nil
        {
            currentList = currentList.next!
        }
        
        if (currentList.value == nil)
        {
            currentList.value = value
        } else
        {
            currentList.next = List()
            currentList.next?.value = value
        }
    }
    
    func get(index : Int) -> String?
    {
        return self.getListItem(index: index)?.value
    }
    
    func getListItem(index : Int) -> List?
    {
        var currentList = self
        var currentIndex = 0
        while (currentList.next != nil && currentIndex < index)
        {
            currentList = currentList.next!
            currentIndex += 1
        }
        
        var result : List? = nil
        
        if (currentIndex == index)
        {
            result = currentList
        }
        return result
    }
    
    
    func delete(index : Int) -> String?
    {
        guard (index <= self.count) else { return nil}
        
        let previous = self.getListItem(index: index - 1)
        let next = self.getListItem(index: index + 1)
        let currentValue = self.getListItem(index: index)?.value
        
        if (previous == nil)
        {
            self.value = self.next?.value
            self.next = self.next?.next
        } else
        {
            previous?.next = next
        }
        
        return currentValue
    }
    
    
    func printAll()
    {
        var currentList : List? = self
        repeat
        {
            print(currentList?.value ?? "")
            currentList = currentList?.next
        } while (currentList?.next != nil)
        print(currentList?.value ?? "")
        print()
    }
    
    var descriptionString: String {
        
        var currentList : List? = self
        var result = currentList?.value ?? ""
        
        while
            let next = currentList?.next,
            let value = next.value {
                currentList = next
                result += ", \(value)"
        }
        
        return result
    }
}

class Queue
{
    var list = List()
    func queue(value : String)
    {
        self.list.append(value: value)
    }
    
    func dequeue() -> String?
    {
        return list.delete(index: 0)
    }
    
    func printAll()
    {
        self.list.printAll()
    }
    
    var descriptionString: String {
        return self.list.descriptionString
    }
}


class Stack
{
    var list = List()
    
    func push(value: String)
    {
        self.list.append(value: value)
    }
    
    func pop() -> String?
    {
        return self.list.delete(index: self.list.count - 1)
    }
    
    func printAll()
    {
        self.list.printAll()
    }
    
    var descriptionString: String {
        return self.list.descriptionString
    }
}

