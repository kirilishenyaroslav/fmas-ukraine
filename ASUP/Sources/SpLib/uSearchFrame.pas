unit uSearchFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, DBGrids, ActnList;

type
    TfmSearch = class(TFrame)
        SearchLabel: TLabel;
        SearchEdit: TEdit;
        InsideBox: TCheckBox;
        SearchButton: TBitBtn;
        AllLabel: TLabel;
        FieldCombo: TComboBox;
        Label1: TLabel;
        SearchNextButton: TBitBtn;
        ActionList1: TActionList;
        SearchAction: TAction;
        SearchNextAction: TAction;
        procedure SearchEditChange(Sender: TObject);
        procedure AllLabelClick(Sender: TObject);
        procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SearchNextActionExecute(Sender: TObject);
        procedure SearchActionExecute(Sender: TObject);
    private
        DataSet: TDataSet;
        SearchFields: array of TField;
        function IsFound(fieldInd: Integer; str: string; Inside: Boolean): Boolean;
        procedure Search(SearchNext: Boolean);
    public
        procedure Prepare(DataSet: TDataSet; Grid: TDBGrid = nil);
    end;

implementation

function TfmSearch.IsFound(fieldInd: Integer; str: string; Inside: Boolean): Boolean;
var
    p, i, f_from, f_to: Integer;
    fieldVal: string;
begin
        // проверить не по всем ли полям поиск
    if fieldInd = -1 then
    begin
        f_from := 0;
        f_to := High(SearchFields);
    end
    else
    begin
        f_from := fieldInd;
        f_to := fieldInd;
    end;

    for i := f_from to f_to do
    begin
        try
            fieldVal := AnsiUpperCase(SearchFields[i].AsString);
        except
            fieldVal := '';
        end;
        p := Pos(str, fieldVal);

        if (Inside and (p <> 0)) or (not Inside and (p = 1)) then
        begin
            Result := True;
            Exit;
        end;
    end;
    Result := False;
end;

procedure TfmSearch.Search(SearchNext: Boolean);
var
    save: TBookmark;
    str: string;
    fieldInd: Integer;
begin
    if DataSet = nil then Exit;

    str := AnsiUpperCase(SearchEdit.Text);
    fieldInd := FieldCombo.ItemIndex - 1;

    with DataSet do
    begin
        DisableControls;
        save := GetBookmark;

        if not SearchNext then First
        else Next;

        while not Eof do
        begin
            if IsFound(fieldInd, str, InsideBox.Checked) then
            begin
                EnableControls;
                //FreeBookmark(save);
                Exit;
            end;

            Next;
        end;
        GotoBookmark(save);
//        FreeBookmark(save);
        EnableControls;
    end;
end;

procedure TfmSearch.Prepare(DataSet: TDataSet; Grid: TDBGrid);
var
    i, j: Integer;
    dName: string;
    need: Boolean;
begin
    Self.DataSet := DataSet;
    with FieldCombo do
    begin
        Items.Clear;
        Items.Add('-Усіма полями-');
        SetLength(SearchFields, 0);

        for i := 0 to DataSet.FieldCount - 1 do
            if DataSet.Fields[i].Visible then
            begin
                need := True;
                dName := DataSet.Fields[i].DisplayLabel;
                    // получить название и видимость, если есть Grid
                if (Grid <> nil) {and ( Grid.Columns.State <> csDefault)} then
                begin
                    need := False;
                    for j := 0 to Grid.Columns.Count - 1 do
                        if Grid.Columns[j].Field = DataSet.Fields[i] then
                        begin
                            need := Grid.Columns[j].Visible;
                            dName := Grid.Columns[j].Title.Caption;
                            break;
                        end;
                end;

                if need then
                begin
                    Items.Add(dName);
                    j := Length(SearchFields);
                    SetLength(SearchFields, j + 1);
                    SearchFields[j] := DataSet.Fields[i];
                end;
            end;
        ItemIndex := 0;
    end;
end;

{$R *.dfm}

procedure TfmSearch.SearchEditChange(Sender: TObject);
begin
    Search(False);
end;

procedure TfmSearch.AllLabelClick(Sender: TObject);
begin
    if DataSet <> nil then
    begin
        DataSet.Last;
        AllLabel.Caption := 'Усього записів : ' + IntToStr(DataSet.RecNo);
    end;
end;

procedure TfmSearch.SearchEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then SearchNextButton.Click;
end;

procedure TfmSearch.SearchNextActionExecute(Sender: TObject);
begin
    Search(True);
end;

procedure TfmSearch.SearchActionExecute(Sender: TObject);
begin
    Search(False);
end;

end.
