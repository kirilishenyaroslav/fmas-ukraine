unit uBonusRemoveOrder;

interface

uses
  SysUtils, Classes, Controls, uFControl, StdCtrls, Graphics, uLabeledFControl,
  Registry, Variants, uCommonSp, fmBonusRemoveOrderUnit, DB, uFormControl, Windows,
  Messages, Forms, Dialogs, RxMemDS, ibase;

    type
    TBonusOrder = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TfmBonusRemoveOrder;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TBonusOrder.Create;
end;

constructor TBonusOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TBonusOrder.Destroy;
begin
    inherited Destroy;
end;

procedure TBonusOrder.Show;
var
    hnd : Integer;
    Mode : TFormMode;
begin
    Form := TfmBonusRemoveOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1 : Mode := fmAdd;
        2 : Mode := fmModify;
        3 : Mode := fmInfo;
    end;
    Form.Id_order_group:=Input['ID_ORDER_GROUP'];

    fmBonusRemoveOrder := Form;

    Form.IdOrder.Value := Input['Id_Order'];
    Form.DateOrder.Value := Input['Date_Order'];

    Form.IdOrderType.Value := Input['Id_Order_Type'];
    Form.NumItem.Value  := Input['Num_Item'];
    Form.SubItem.Value := Input['Sub_Item'];
    Form.IdOrderGroup.Value := Input['Id_Order_Group'];
    Form.Intro.Value := Input['Intro'];

    Form.FormControl.Prepare(Form.LocalDatabase, Mode, Input['Id_Order'], 0);

    Form.ShowModal;

    if Form.IdOrder.Value <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder.Value;
        Output.Post;
    end;

    Form.Free;
end;

end.
