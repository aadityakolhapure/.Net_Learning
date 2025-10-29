namespace CodeFirstEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Students",
                c => new
                    {
                        SId = c.Int(nullable: false, identity: true),
                        SName = c.String(),
                        Age = c.Int(nullable: false),
                        Address = c.String(),
                    })
                .PrimaryKey(t => t.SId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Students");
        }
    }
}
