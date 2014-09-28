unit UPremiaFOrderAddNW;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, AppEvnts,
  ActnList;

type
  TfrmAddNW = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Fio: TqFSpravControl;
    Department: TqFSpravControl;
    ActionList1: TActionList;
    OKBut: TAction;
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormCreate(Sender: TObject);
    procedure OKButExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FIOText:String;

implementation

uses UpPremiaFOrderForm, uShtatUtils, {uUnivSprav,} RxMemDS, FIBDatabase, AllPeopleUnit;

{$R *.dfm}

procedure TfrmAddNW.DepartmentOpenSprav(Sender: TObject;
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
                  FieldValues['DBHandle']   := Integer(TfmPremiaOrder(self.Owner).WorkDatabase.Handle);
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

//вызов справочника физ.лиц
procedure TfrmAddNW.FioOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    result : Variant;
begin
    try

      //  result := AllPeopleUnit.ShowSpPrCards(Self, TfmPremiaOrder(self.Owner).WorkDatabase.Handle, True);
       // result := AllPeopleUnit.GetManForASUPPrCards(Self, TfmPremiaOrder(self.Owner).WorkDatabase.Handle, False, True);

        //result := AllPeopleUnit.GetManUnemployed(Self, TfmPremiaOrder(self.Owner).WorkDatabase.Handle, False, True);

        result := AllPeopleUnit.GetManForASUP(Self, TfmPremiaOrder(self.Owner).WorkDatabase.Handle, False, True);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
            FIOText:=result[2]+' ';
            if result[3]<>'' then FIOText:=FIOText+copy(result[3],1,1)+'.';
            if result[4]<>'' then FIOText:=FIOText+copy(result[4],1,1)+'.';
        end;

    except on e:Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                        e.Message + '"');
            exit;
        end;
    end;

end;


procedure TfrmAddNW.FormCreate(Sender: TObject);
begin
    if (TfmPremiaOrder(self.Owner).IdType.ItemIndex=1) then Department.Blocked:=False;
    if (TfmPremiaOrder(self.Owner).IdType.ItemIndex=0) then Department.Blocked:=True;
end;

procedure TfrmAddNW.OKButExecute(Sender: TObject);
begin
     if not qFCheckAll(Self)
     then exit;
     ModalResult := mrOk;
end;

end.
