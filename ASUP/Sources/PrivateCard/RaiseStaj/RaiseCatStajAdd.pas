unit RaiseCatStajAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtons, uCommonSp;

type
  TfrmCatRaiseStajEdit = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    Label2: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label3: TLabel;
    cxLookupComboBox2: TcxLookupComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    id_raise:integer;
    { Public declarations }
  end;


implementation

uses RaiseStajData;

{$R *.dfm}

procedure TfrmCatRaiseStajEdit.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mryes;
end;

procedure TfrmCatRaiseStajEdit.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmCatRaiseStajEdit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
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
              cxButtonEdit1.text := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfrmCatRaiseStajEdit.FormCreate(Sender: TObject);
begin
     DM.StajDataSet.Close;
     DM.StajDataSet.Open;
     DM.CatDataSet.Close;
     DM.CatDataSet.Open;
end;

end.
