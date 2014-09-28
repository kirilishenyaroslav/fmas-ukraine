unit uAddJnPostTarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uLogicCheck, uSimpleCheck, ActnList, DB, RxMemDS, StdCtrls,
  Buttons, uFControl, uLabeledFControl, uDateControl, uSpravControl, uCommonSP,
  FIBDatabase, pFIBDatabase, uUnivSprav, iBase, FIBDataSet, pFIBDataSet;

type
  TfmAddJnPostTarif = class(TForm)
    Date_Beg: TqFDateControl;
    Date_End: TqFDateControl;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    TarifDS: TRxMemoryData;
    ActionList1: TActionList;
    OkAction: TAction;
    qFSimpleCheck1: TqFSimpleCheck;
    TarifSpr: TqFSpravControl;
    pFIBTrRead: TpFIBTransaction;
    DSTarifDate: TpFIBDataSet;
    DB: TpFIBDatabase;
    procedure TarifSprOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Id_BS: Integer;
    Id_Jn_Post_Tarif: Integer;
    Num: Integer;
    Rate_Out: Double;
    DBHandle: TISC_DB_HANDLE;
    Id_Cat_Tarif_Grid, Id_Category_Tarif: Integer;
    Tar_Date_Beg, Tar_Date_End : TDate;
    Name_Tarif : String;
    constructor Create(AOwner: TComponent; aDBHandle: TISC_DB_HANDLE); reintroduce;

  end;

var
  fmAddJnPostTarif: TfmAddJnPostTarif;

implementation

{$R *.dfm}

uses qFTools;

procedure TfmAddJnPostTarif.TarifSprOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    sp: TSprav;

begin
    sp := GetSprav('ASUP\TarifGrid');
    if sp <> nil then
    begin
        with sp.Input do
        begin

            Append;
            FieldValues['DBHandle']  := Integer(DBHandle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['DateBegIn'] := Date_Beg.Value;
            FieldValues['DateEndIn'] := Date_End.Value;
            Post;
        end;
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Num               := sp.Output['Num_Category'];
            Id_Category_Tarif := sp.Output['ID_CATEGORY_TARIF'];
            Rate_Out          := sp.Output['Rate_Out'];

            Name_tarif        := VarToStr(sp.Output['Name_Tarif'])+' ('+
                                 VarToStr(sp.Output['Num_Category'])+' розряд)';

           {* Tar_Date_Beg      := sp.Output['Date_Beg'];
            Tar_Date_End      := sp.Output['Date_End'];*}
            Value       := sp.Output['Id_Cat_Tarif_Grid'];
            DisplayText := Name_tarif;

            DSTarifDate.close;
            DSTarifDate.ParamByName('Id_Category_tarif').AsInteger := Id_Category_Tarif;
            DSTarifDate.Open;

            Tar_Date_Beg      := DSTarifDate['Date_Beg'];
            Tar_Date_End      := DSTarifDate['Date_End'];

            if ((Tar_Date_Beg <= Date_End.Value) and
               (Date_Beg.Value <= Tar_Date_End))
            then begin
                 //проверить периоды и безжалостно отрезать лишнее
                 if (Tar_Date_Beg > Date_Beg.Value) then
                    Date_Beg.Value := Tar_Date_Beg;
                 if (Tar_Date_End < Date_End.Value) then
                    Date_End.Value := Tar_Date_End;
            end;

        end;
        sp.Free;
    end;
end;

procedure TfmAddJnPostTarif.OkActionExecute(Sender: TObject);
begin
    if ((not qFCheckAll(Self)) or (TarifSpr.Value = null)) then
    begin
        ModalResult := 0;
        Exit;
    end
    else
    begin
        TarifDS.Open;
        TarifDS.Append;
        TarifDS['Id_Cat_Tarif_Grid']   := TarifSpr.Value;
        TarifDS['Num']                 := Num;
        TarifDS['Date_Beg']            := Date_Beg.Value;
        TarifDS['Date_End']            := Date_End.Value;
        TarifDS['Id_Jn_Post_Tarif']    := Id_Jn_Post_Tarif;
        TarifDS['Id_Post_Base_Salary'] := Id_BS;
        TarifDS['Name_tarif']          := Name_Tarif;
        TarifDS['Id_Category_tarif']   := Id_Category_tarif;
        TarifDS.Post;
        ModalResult := mrOk;
    end;
end;

constructor TfmAddJnPostTarif.Create(AOwner: TComponent; aDBHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
   try
    DBHandle := aDBHandle;

   // TarifSpr.Value := Id_Cat_Tarif_Grid;
    DB.Handle := aDBHandle;
 //   pFIBTrRead.DefaultDatabase.Handle := aDBHandle;
 //   DSTarifDate.Database.Handle := aDBHandle;
 //   DSTarifDate.Transaction := pFIBTrRead;
   except on E:Exception do Showmessage(E.Message);
   end;
end;
end.
