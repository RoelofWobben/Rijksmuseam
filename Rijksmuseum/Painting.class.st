Class {
	#name : #Painting,
	#superclass : #Object,
	#instVars : [
		'title',
		'painter',
		'imageUrl',
		'objectNumber'
	],
	#category : #Rijksmuseum
}

{ #category : #data }
Painting >> getMoreData [
	| url url2 json json2 artObjectJson levelsJson |
	url := 'https://www.rijksmuseum.nl/api/nl/collection/' , objectNumber
		, '?key=14OGzuak&format=json'.
	url2 := 'https://www.rijksmuseum.nl/api/nl/collection/'
		, objectNumber , '/tiles?key=14OGzuak&format=json'.
	"Read the data from the api respons"
	json := NeoJSONReader fromString: (ZnEasy get: url) contents.
	artObjectJson := json at: #artObject.
	painter := ((artObjectJson at: #principalMakers) at: 1) at: #name.
	title := artObjectJson at: #title.
	"Read the imageUrl from the api respons"
	json2 := NeoJSONReader fromString: (ZnEasy get: url2) contents.
	levelsJson := json2 at: #levels.
	imageUrl := (((levelsJson at: 6) at: #tiles) at:1) at: #url  
]

{ #category : #accessing }
Painting >> imageUrl [
	^ imageUrl
]

{ #category : #accessing }
Painting >> imageUrl: aString [ 
	imageUrl := aString
]

{ #category : #accessing }
Painting >> objectNumber [
	^ objectNumber
]

{ #category : #accessing }
Painting >> objectNumber: aString [ 
	objectNumber := aString
]

{ #category : #accessing }
Painting >> painter [
	^ painter
]

{ #category : #accessing }
Painting >> painter: aString [ 
	painter := aString
]

{ #category : #accessing }
Painting >> title [
	^ title
]

{ #category : #accessing }
Painting >> title: aString [ 
	title := aString
]
