describe "Chatroom" do
    # before do
    #     @room = Struct.new(:name, :messages, :users).new("General", [], ["Alice"])
    # end

    # def room
    #     @room ||= Struct.new(:name, :messages, :users).new("General", [], ["Alice"])
    # end

    let(:room) { Struct.new(:name, :messages, :users).new("General", [], ["Alice"]) }

    it "should have a name" do
        expect(room.name).to eq("General")
    end

    it "should have a list of messages" do
        expect(room.messages).to be_empty
    end

    it "can tell who is in the room" do
        expect(room.users).to include("Alice")
    end

    context "there are three users" do
        before do
            @users = ["Alice", "Bob", "Charlie"]
        end

        context "Alice and Bob enters the room" do
            before do
                room.users = ["Alice", "Bob"]
            end

            it "should not have Charlie in the room" do
                expect(room.users).not_to include("Charlie")
            end
        end
    end
end