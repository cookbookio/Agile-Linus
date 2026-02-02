#!/usr/bin/env python
"""
Simple test script to verify the Flask application works with Python 3
"""
import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(__file__))

# Set UTF-8 encoding for Windows console
if sys.platform == 'win32':
    import io
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

def test_imports():
    """Test that all imports work correctly"""
    try:
        from flask import Flask, request, jsonify, render_template
        import sqlite3
        import json
        import app
        print("✓ All imports successful")
        return True
    except Exception as e:
        print(f"✗ Import failed: {e}")
        return False

def test_database():
    """Test database initialization"""
    try:
        import app
        import os
        
        # Remove existing database if it exists
        if os.path.exists('app.db'):
            os.remove('app.db')
            
        # Initialize database
        app.init_db()
        
        # Test database connection
        conn = app.get_db_connection()
        cursor = conn.cursor()
        
        # Check if tables were created
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = cursor.fetchall()
        table_names = [table[0] for table in tables]
        
        expected_tables = ['users', 'recipes', 'ingredients', 'tags', 'recipe_ingredients', 'recipe_tags']
        
        for table in expected_tables:
            if table in table_names:
                print(f"✓ Table '{table}' exists")
            else:
                print(f"✗ Table '{table}' missing")
                return False
                
        # Check if sample data was inserted
        cursor.execute("SELECT COUNT(*) FROM recipes")
        recipe_count = cursor.fetchone()[0]
        
        if recipe_count > 0:
            print(f"✓ Sample data inserted ({recipe_count} recipes)")
        else:
            print("✗ No sample data found")
            return False
            
        conn.close()
        return True
        
    except Exception as e:
        print(f"✗ Database test failed: {e}")
        return False

def test_flask_app():
    """Test Flask app creation"""
    try:
        from flask import Flask
        import app
        
        # Test that app is a Flask instance
        if hasattr(app, 'app') and isinstance(app.app, Flask):
            print("✓ Flask app created successfully")
            return True
        else:
            print("✗ Flask app not found or invalid")
            return False
            
    except Exception as e:
        print(f"✗ Flask app test failed: {e}")
        return False

def test_routes():
    """Test that routes are registered"""
    try:
        import app
        
        # Get all registered routes
        routes = []
        for rule in app.app.url_map.iter_rules():
            if rule.endpoint != 'static':
                routes.append(rule.rule)
        
        expected_routes = [
            '/',
            '/recipes/<int:id>/',
            '/api',
            '/api/user/create/',
            '/api/user/me/',
            '/api/user/token/',
            '/api/recipe/recipes/',
            '/api/recipe/ingredients/',
            '/api/recipe/tags/',
        ]
        
        for route in expected_routes:
            if any(route.startswith(expected) or expected.startswith(route) for expected in expected_routes):
                print(f"✓ Route '{route}' registered")
            else:
                print(f"✗ Route '{route}' missing")
                return False
                
        print(f"✓ Found {len(routes)} routes total")
        return True
        
    except Exception as e:
        print(f"✗ Routes test failed: {e}")
        return False

def main():
    """Run all tests"""
    print("Testing Flask application compatibility with Python 3...")
    print("=" * 50)
    
    tests = [
        test_imports,
        test_database,
        test_flask_app,
        test_routes,
    ]
    
    passed = 0
    total = len(tests)
    
    for test in tests:
        if test():
            passed += 1
        print()
    
    print("=" * 50)
    print(f"Test Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All tests passed! The application is compatible with Python 3.")
        return True
    else:
        print("❌ Some tests failed. Please check the errors above.")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)