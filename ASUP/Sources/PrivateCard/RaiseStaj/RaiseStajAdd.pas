unit RaiseStajAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uFloatControl, uCharControl, uIntControl,
  uFControl, uLabeledFControl, uSpravControl, uFormControl, StdCtrls,
  Buttons, FIBDatabase, pFIBDatabase,  uCommonSp,
  RaiseStajData, cxCalendar, cxDropDownEdit, cxCalc, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLookAndFeelPainters, cxButtons;

type
  TAddRaise = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxCalcEdit1: TcxCalcEdit;
    Label4: TLabel;
    cxCalcEdit2: TcxCalcEdit;
    Label5: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label6: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function CheckData:Boolean;
  public
        id_raise:integer;
  end;

implementation

{$R *.dfm}

function TAddRaise.CheckData: Boolean;
begin
     Result:=true
end;

procedure TAddRaise.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
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

procedure TAddRaise.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then begin
                    ModalResult:=mrYes;
     end;
end;

procedure TAddRaise.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TAddRaise.FormCreate(Sender: TObject);
begin
     cxDateEdit1.Date:=StrToDate('01.01.1900');
     cxDateEdit2.Date:=StrToDate('31.12.2050');
     DM.StajDataSet.Close;
     DM.StajDataSet.Open;
end;

end.
