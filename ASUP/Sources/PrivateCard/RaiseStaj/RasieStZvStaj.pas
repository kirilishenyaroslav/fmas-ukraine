unit RasieStZvStaj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfrmStZvStaj = class(TForm)
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxDateBeg: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    SprRaise: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SprRaisePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
  id_raise:Integer;
    { Public declarations }
  end;

var
  frmStZvStaj: TfrmStZvStaj;

implementation

uses RaiseStajData, uCommonSp;

{$R *.dfm}

procedure TfrmStZvStaj.cxButton1Click(Sender: TObject);
begin
    ModalResult:=mrYes;
end;

procedure TfrmStZvStaj.cxButton2Click(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TfrmStZvStaj.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
              Append;
              FieldValues['DBHandle'] := Integer(Dm.DB.Handle);
                  // модальный показ
              FieldValues['ShowStyle'] := 0;
                  // единичная выборка
              FieldValues['Select'] := 1;

              FieldValues['Raise_Select_Kind'] := 1;
              FieldValues['Actual_Date'] := Date;
              Post;
        end;
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
              id_raise := sp.Output['Id_Raise'];
              SprRaise.text := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfrmStZvStaj.SprRaisePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
              Append;
              FieldValues['DBHandle'] := Integer(Dm.DB.Handle);
                  // модальный показ
              FieldValues['ShowStyle'] := 0;
                  // единичная выборка
              FieldValues['Select'] := 1;

              FieldValues['Raise_Select_Kind'] := 1;
              FieldValues['Actual_Date'] := Date;
              Post;
        end;
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
              id_raise := sp.Output['Id_Raise'];
              SprRaise.text := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

end.
