unit SelectHospUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  PersonalCommon;

type
  TSelectHospForm = class(TForm)
    HospGrid: TDBGrid;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    HospQuery: TIBQuery;
    HospQueryID_MAN_HOSP: TIntegerField;
    HospQuerySERIA: TIBStringField;
    HospQueryNOMER: TIBStringField;
    HospQueryILNESS_NOTES: TIBStringField;
    HospQueryDATE_BEG: TDateField;
    HospQueryDATE_END: TDateField;
    HospQueryVOPL: TIntegerField;
    HospSource: TDataSource;
    HospQueryID_PARENT: TIntegerField;
    HospQueryPERCENT: TIBBCDField;
    HospQueryKOD: TIBStringField;
    HospQueryILLNESS_TYPE: TIntegerField;
    HospQueryENDING: TIntegerField;
    HospQueryHOSP_VERSION: TIntegerField;
    procedure HospGridDblClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public

    procedure Prepare(ID:Integer);
    
  end;

var
  SelectHospForm: TSelectHospForm;
  ID_PCARD:Integer;
implementation

procedure TSelectHospForm.Prepare(Id:Integer);
begin
   HospQuery.Transaction := ReadTransaction;
   ID_PCARD:=ID;
   HospQuery.Params.ParamValues['ID_PCARD']:=ID_PCARD;
   HospQuery.Open;
end;

{$R *.dfm}

procedure TSelectHospForm.HospGridDblClick(Sender: TObject);
begin
    if not HospQuery.IsEmpty then OkButton.Click;
end;

procedure TSelectHospForm.OkButtonClick(Sender: TObject);
begin
    if HospQueryENDING.Value <> 2 then
    begin
        MessageDlg('Вибраний лист працездатності є закритим!', mtError, [mbOk], 0);
        ModalResult := 0;
        Exit;
    end;
end;

end.
