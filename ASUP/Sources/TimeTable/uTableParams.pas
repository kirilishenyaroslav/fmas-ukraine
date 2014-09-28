unit uTableParams;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Spin;

type
    TfrmTableParams = class(TForm)
        Label1: TLabel;
        DecBox: TComboBox;
        Label2: TLabel;
        Label3: TLabel;
        Height: TSpinEdit;
        Label4: TLabel;
        Width: TSpinEdit;
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmTableParams: TfrmTableParams;

implementation

{$R *.dfm}

end.
