Class {
	#name : #Paintings,
	#superclass : #Object,
	#instVars : [
		'paintings'
	],
	#category : #Rijksmuseum
}

{ #category : #'instance creation' }
Paintings class >> fromJSON: json [
    | paintings |
    paintings := self new.
    (json at: #artObjects)
        do:
            [ 	:eachArtObject | 
	    			|painting|			
					painting := Painting new.
    				painting
 			      		objectNumber: (eachArtObject  at: #objectNumber).
   				     	paintings addPainting: painting ].
    ^ paintings
]

{ #category : #adding }
Paintings >> addPainting: aPainting [ 
	paintings := paintings ifNil: [ OrderedCollection new ].
	paintings add: aPainting.
]

{ #category : #data }
Paintings >> getPaintings [
	"comment stating purpose of message"

	| collectionUrl json |
	collectionUrl := 'https://www.rijksmuseum.nl/api/nl/collection?key=14OGzuak&format=json&type=schilderij&toppieces=True'.
	json := NeoJSONReader
		fromString: (ZnEasy get: collectionUrl) contents.
	paintings := self class fromJSON: json.
	paintings paintings do: [ :painting | painting getMoreData ]
]

{ #category : #adding }
Paintings >> paintings [
	^paintings
]
