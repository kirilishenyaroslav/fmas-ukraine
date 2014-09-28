unit SchAnalizeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBCtrls, DB,
  FIBDataSet, pFIBDataSet, cxButtonEdit;

type
  TfrmSchAnalizeEdit = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    TypeValDataSet: TpFIBDataSet;
    TypeValueDataSource: TDataSource;
    ckDefaultValue: TCheckBox;
    EdDefaultvalue: TcxButtonEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckDefaultValueClick(Sender: TObject);
    procedure EdDefaultvaluePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    CurIndex:Integer;
    Id_def_val:Integer;
    { Public declarations }
  end;


implementation

uses SchAnalizeMain, GlobalSpr;
{$R *.dfm}

procedure TfrmSchAnalizeEdit.cxButton1Click(Sender: TObject);
begin
      if (DBLookupComboBox1.KeyValue=3)
      then begin
          if not ckDefaultValue.Checked
          then begin
               ShowMessage('Для данного типа значения аналитики необходимо обязательно значение по умолчанию');
          end
          else begin
               if EdDefaultvalue.Text=''
               then ShowMessage('Для данного типа значения аналитики необходимо обязательно значение по умолчанию');
          end;
      end;
      ModalResult:=mrYes;
end;

procedure TfrmSchAnalizeEdit.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmSchAnalizeEdit.FormCreate(Sender: TObject);
begin
     TypeValDataSet.Database:=TfrmSchAnalize(owner).WorkDatabase;
     TypeValDataSet.Transaction:=TfrmSchAnalize(owner).ReadTransaction;
     TypeValDataSet.Open;
     TypeValDataSet.FetchAll;
end;

procedure TfrmSchAnalizeEdit.ckDefaultValueClick(Sender: TObject);
begin
     EdDefaultvalue.Enabled:=ckDefaultValue.Checked;
end;

procedure TfrmSchAnalizeEdit.EdDefaultvaluePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetEnumTypeFilter(self,TfrmSchAnalize(owner).WorkDatabase.Handle,fsNormal,CurIndex);
    if VarArrayDimCount(Res)>0
    then begin
         Id_def_val:=Res[0];
         EdDefaultvalue.Text:=VarToStr(Res[1]);
    end;
end;

end.
