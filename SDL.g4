grammar SDL;

file 
    : declaration* EOF
    ;

declaration
    : modelDeclaration
    // | enumDeclaration NOT IMPLEMENTED YET
    | serviceDeclaration
    ;

modelDeclaration
    : Model Identifier LeftBrace modelMember* RightBrace
    ;

modelMember
    : type Identifier Semicolon
    ;

serviceDeclaration
    : Service Identifier LeftBrace serviceMethod* RightBrace
    ;

serviceMethod
    : typeOrVoid Identifier LeftParen methodParameterList? RightParen Semicolon
    ;

methodParameterList
    : methodParameter
    | methodParameterList Comma methodParameter
    ;

methodParameter
    : type Identifier
    ;

typeOrVoid
    : type
    | Void
    ;

type
    : basicType
    | arrayType
    ;

arrayType
    : basicType ( LeftBracket RightBracket )+
    ;

basicType
    : internalType
    | modelType
    ;

modelType
    : Identifier
    ;

internalType
    : Bool
    | Char
    | Decimal
    | Double
    | Float
    | Int
    | Long
    | Short
    | String
    ;

Bool : 'bool';
Char : 'char';
Decimal : 'decimal';
Double : 'double';
// Enum : 'enum'; NOT IMPLEMENTED YET
Float : 'float';
Int : 'int';
Long : 'long';
Model : 'model';
Service : 'service';
Short : 'short';
String : 'string';
Void : 'void';

Question : '?';
Comma : ',';
Colon : ':';
Semicolon : ';';
LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';
LeftAngle : '<';
RightAngle : '>';

Identifier : Nondigit ( Nondigit | Digit )*;

fragment Nondigit : [a-zA-Z_];
fragment Digit : [0-9];

Whitespace : [ \t]+ -> skip;
Newline : ( '\r''\n'? | '\n' ) -> skip;
BlockComment : '/*' .*? '*/' -> skip;
LineComment : '//' ~[\r\n]* -> skip;
