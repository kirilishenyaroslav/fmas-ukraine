unit ULevelsEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxColorComboBox, StdCtrls, Buttons, cxCheckBox;

type
    TfrmUpLevelsEdit = class(TForm)
        ContentColor: TcxColorComboBox;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FontColor: TcxColorComboBox;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        levelName: TcxTextEdit;
        cxchckbx1: TcxCheckBox;
    private
    { Private declarations }
    public
    { Public declarations }
    end;



implementation

{$R *.dfm}

end.
