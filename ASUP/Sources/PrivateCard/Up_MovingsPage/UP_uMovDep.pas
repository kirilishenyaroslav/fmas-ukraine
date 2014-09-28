unit UP_uMovDep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl, uCommonSP, ibase;

type
  TUP_uMovingDep = class(TForm)
    Per_Department: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure Per_DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
    lid_moving:Int64;
    DBHandle:TISC_DB_HANDLE;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADBHandle:TISC_DB_HANDLE;id_moving:int64);reintroduce;
  end;

var
  UP_uMovingDep: TUP_uMovingDep;

implementation

{$R *.dfm}

uses Up_uMovingsFrame;

constructor TUP_uMovingDep.Create(AOwner: TComponent; ADBHandle:TISC_DB_HANDLE; id_moving: int64);
begin
    inherited Create(Aowner);
    lid_moving:=id_moving;
    DBHandle:=ADBHandle;

//    SmetsDataSet.Database:=TfmPCardMovingsPage(Owner).DB;
//    BonusSelect.Database:=TfmPCardMovingsPage(Owner).DB;
//    SmetsDataSet.Transaction:=TfmPCardMovingsPage(Owner).ReadTransaction;
//    BonusSelect.Transaction:=TfmPCardMovingsPage(Owner).ReadTransaction;
//    SmetsDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_SMET_INFO(?ID_MAN_BONUS)';

    {if id_level=null
    then BonusSelect.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_INFO_BY_MOVING('+IntToStr(lid_moving)+',null)'
    else begin
              BonusSelect.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_INFO_BY_MOVING('+IntToStr(lid_moving)+','+VarToStr(id_level)+')';
    end;
    BonusSelect.Open;
    ReportDataView.ViewData.Expand(true); }
end;
procedure TUP_uMovingDep.Per_DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;

begin
     sp := GetSprav('SpDepartment');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(DBHandle);
                  FieldValues['Select']     := 1;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value := sp.Output['ID_DEPARTMENT'];
                      DisplayText := sp.Output['NAME_FULL'];
            end;
     end;



end;

procedure TUP_uMovingDep.OkButtonClick(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

end.
