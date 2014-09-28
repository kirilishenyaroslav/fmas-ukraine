unit UPremiaOrderEditExtInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl;

type
  TfrmGetExtInfo = class(TForm)
    Label3: TLabel;
    Department: TqFSpravControl;
    PostSalary: TqFSpravControl;
    Label4: TLabel;
    qFSC_SovmestFIO: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    SovmKoeff: TqFFloatControl;
    TypePost: TqFSpravControl;
    procedure OkButtonClick(Sender: TObject);
    procedure TypePostOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_SovmestFIOOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UpPremiaOrderForm, uShtatUtils, uUnivSprav, RxMemDS, FIBDatabase;

{$R *.dfm}

procedure TfrmGetExtInfo.OkButtonClick(Sender: TObject);
begin
     if not qFCheckAll(Self)
     then exit;
     ModalResult := mrOk;
end;

procedure TfrmGetExtInfo.TypePostOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник типів персонала';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='SP_TYPE_POST';
      Params.Fields:='NAME_TYPE_POST,ID_TYPE_POST';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_TYPE_POST';
      Params.ReturnFields:='NAME_TYPE_POST,ID_TYPE_POST';
      Params.DBHandle:=Integer(TfmPremiaOrder(self.Owner).WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_TYPE_POST'];
                 DisplayText:=VarToStr(output['NAME_TYPE_POST']);
      end;
end;

procedure TfrmGetExtInfo.qFSC_SovmestFIOOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('asup\PCardsList');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(TfmPremiaOrder(self.Owner).WorkDatabase.Handle);
                  FieldValues['ActualDate'] := Date;
                  FieldValues['AdminMode']  := 0;
                  FieldValues['Select']     := 1;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value := sp.Output['ID_PCARD'];
                      DisplayText := sp.Output['FIO'];
            end;
     end;
end;

procedure TfrmGetExtInfo.DepartmentOpenSprav(Sender: TObject;
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

procedure TfrmGetExtInfo.PostSalaryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var   DM :TdmShtatUtils;
begin
      DM := TdmShtatUtils.Create(self, Integer(TfmPremiaOrder(self.Owner).WorkDatabase.Handle),  Date);
      DM.GetSalary(Value,DisplayText);
end;

end.
